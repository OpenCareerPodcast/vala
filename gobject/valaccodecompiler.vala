/* valaccodecompiler.vala
 *
 * Copyright (C) 2007  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

/**
 * Interface to the C compiler.
 */
public class Vala.CCodeCompiler {
	public CCodeCompiler () {
	}

	/**
	 * Compile generated C code to object code and optionally link object
	 * files.
	 *
	 * @param context a code context
	 */
	public void compile (CodeContext! context) {
		string pc = "pkg-config --cflags";
		if (!context.compile_only) {
			pc += " --libs";
		}
		foreach (string pkg in context.get_packages ()) {
			pc += " " + pkg;
		}
		string pkgflags;
		int exit_status;
		Error err = null;
		if (!Process.spawn_command_line_sync (pc, out pkgflags, null, ref exit_status, out err)) {
			Report.error (null, err.message);
			return;
		} else if (exit_status != 0) {
			Report.error (null, "pkg-config exited with status %d".printf (exit_status));
			return;
		}

		// TODO compile the C code files in parallel

		string cmdline = "cc";
		if (context.debug) {
			cmdline += " -g";
		}
		cmdline += " -O%d".printf (context.optlevel);
		if (context.compile_only) {
			cmdline += " -c";
		} else if (context.output != null) {
			cmdline += " -o " + Shell.quote (context.output);
		}
		cmdline += " " + pkgflags;

		/* we're only interested in non-pkg source files */
		var source_files = context.get_source_files ();
		foreach (SourceFile file in source_files) {
			if (!file.pkg) {
				cmdline += " " + Shell.quote (file.get_csource_filename ());
			}
		}

		bool success = Process.spawn_command_line_sync (cmdline, null, null, ref exit_status, out err);

		/* remove generated C source and header files */
		foreach (SourceFile file in source_files) {
			if (!file.pkg) {
				FileUtils.unlink (file.get_csource_filename ());
				FileUtils.unlink (file.get_cheader_filename ());
			}
		}

		if (!success) {
			Report.error (null, err.message);
		} else if (exit_status != 0) {
			Report.error (null, "cc exited with status %d".printf (exit_status));
		}
	}
}
