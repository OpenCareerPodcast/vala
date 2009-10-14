/*
 * Valadoc - a documentation tool for vala.
 * Copyright (C) 2008 Florian Brosch
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

using Vala;
using GLib;
using Gee;

public interface Valadoc.PropertyHandler : Api.Node {
	protected bool is_overwritten_property (Property prop) {
		foreach (Property p in get_property_list ()) {
			if (p.parent != this)
				continue ;

			if (!p.is_override)
				continue ;

			if (p.equals (prop))
				return true;
		}
		return false;
	}

	public Gee.Collection<Property> get_property_list () {
		return get_children_by_type (Api.NodeType.PROPERTY);
	}

	public void visit_properties (Doclet doclet) {
		accept_children_by_type (Api.NodeType.PROPERTY, doclet);
	}
}
