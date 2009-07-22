/* poppler-glib.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Poppler", lower_case_cprefix = "poppler_")]
namespace Poppler {
	[Compact]
	[CCode (copy_function = "poppler_action_copy", type_id = "POPPLER_TYPE_ACTION", cheader_filename = "poppler.h")]
	public class Action {
		public weak Poppler.ActionAny any;
		public weak Poppler.ActionGotoDest goto_dest;
		public weak Poppler.ActionGotoRemote goto_remote;
		public weak Poppler.ActionLaunch launch;
		public weak Poppler.ActionMovie movie;
		public weak Poppler.ActionNamed named;
		public Poppler.ActionType type;
		public weak Poppler.ActionUri uri;
		public Poppler.Action copy ();
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionAny {
		public weak string title;
		public Poppler.ActionType type;
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionGotoDest {
		public weak Poppler.Dest dest;
		public weak string title;
		public Poppler.ActionType type;
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionGotoRemote {
		public weak Poppler.Dest dest;
		public weak string file_name;
		public weak string title;
		public Poppler.ActionType type;
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionLaunch {
		public weak string file_name;
		public weak string params;
		public weak string title;
		public Poppler.ActionType type;
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionMovie {
		public weak string title;
		public Poppler.ActionType type;
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionNamed {
		public weak string named_dest;
		public weak string title;
		public Poppler.ActionType type;
	}
	[Compact]
	[CCode (cheader_filename = "poppler.h")]
	public class ActionUri {
		public weak string title;
		public Poppler.ActionType type;
		public weak string uri;
	}
	[CCode (cheader_filename = "poppler.h")]
	public class Attachment : GLib.Object {
		public weak GLib.StringBuilder checksum;
		public GLib.Time ctime;
		public weak string description;
		public GLib.Time mtime;
		public weak string name;
		public size_t size;
		public bool save (string filename) throws GLib.Error;
		public bool save_to_callback (Poppler.AttachmentSaveFunc save_func) throws GLib.Error;
	}
	[Compact]
	[CCode (copy_function = "poppler_dest_copy", type_id = "POPPLER_TYPE_DEST", cheader_filename = "poppler.h")]
	public class Dest {
		public double bottom;
		public uint change_left;
		public uint change_top;
		public uint change_zoom;
		public double left;
		public weak string named_dest;
		public int page_num;
		public double right;
		public double top;
		public Poppler.DestType type;
		public double zoom;
		public Poppler.Dest copy ();
	}
	[CCode (cheader_filename = "poppler.h")]
	public class Document : GLib.Object {
		public unowned Poppler.Dest find_dest (string link_name);
		[CCode (has_construct_function = false)]
		public Document.from_data (string data, int length, string password) throws GLib.Error;
		[CCode (has_construct_function = false)]
		public Document.from_file (string uri, string? password) throws GLib.Error;
		public unowned GLib.List get_attachments ();
		public unowned Poppler.FormField get_form_field (int id);
		public int get_n_pages ();
		public unowned Poppler.Page get_page (int index);
		public unowned Poppler.Page get_page_by_label (string label);
		public bool has_attachments ();
		public bool save (string uri) throws GLib.Error;
		[NoAccessorMethod]
		public string author { owned get; }
		[NoAccessorMethod]
		public int creation_date { get; }
		[NoAccessorMethod]
		public string creator { owned get; }
		[NoAccessorMethod]
		public string format { owned get; }
		[NoAccessorMethod]
		public string keywords { owned get; }
		[NoAccessorMethod]
		public string linearized { owned get; }
		[NoAccessorMethod]
		public string metadata { owned get; }
		[NoAccessorMethod]
		public int mod_date { get; }
		[NoAccessorMethod]
		public Poppler.PageLayout page_layout { get; }
		[NoAccessorMethod]
		public Poppler.PageMode page_mode { get; }
		[NoAccessorMethod]
		public Poppler.Permissions permissions { get; }
		[NoAccessorMethod]
		public string producer { owned get; }
		[NoAccessorMethod]
		public string subject { owned get; }
		[NoAccessorMethod]
		public string title { owned get; }
		[NoAccessorMethod]
		public Poppler.ViewerPreferences viewer_preferences { get; }
	}
	[CCode (cheader_filename = "poppler.h")]
	public class FontInfo : GLib.Object {
		public void free ();
		[CCode (has_construct_function = false)]
		public FontInfo (Poppler.Document document);
		public bool scan (int n_pages, out unowned Poppler.FontsIter iter);
	}
	[Compact]
	[CCode (copy_function = "poppler_fonts_iter_copy", type_id = "POPPLER_TYPE_FONTS_ITER", cheader_filename = "poppler.h")]
	public class FontsIter {
		public Poppler.FontsIter copy ();
		public unowned string get_file_name ();
		public Poppler.FontType get_font_type ();
		public unowned string get_full_name ();
		public unowned string get_name ();
		public bool is_embedded ();
		public bool is_subset ();
		public bool next ();
	}
	[CCode (cheader_filename = "poppler.h")]
	public class FormField : GLib.Object {
		public Poppler.FormButtonType button_get_button_type ();
		public bool button_get_state ();
		public void button_set_state (bool state);
		public bool choice_can_select_multiple ();
		public bool choice_commit_on_change ();
		public bool choice_do_spell_check ();
		public Poppler.FormChoiceType choice_get_choice_type ();
		public unowned string choice_get_item (int index);
		public int choice_get_n_items ();
		public unowned string choice_get_text ();
		public bool choice_is_editable ();
		public bool choice_is_item_selected (int index);
		public void choice_select_item (int index);
		public void choice_set_text (string text);
		public void choice_toggle_item (int index);
		public void choice_unselect_all ();
		public Poppler.FormFieldType get_field_type ();
		public double get_font_size ();
		public int get_id ();
		public bool is_read_only ();
		public bool text_do_scroll ();
		public bool text_do_spell_check ();
		public int text_get_max_len ();
		public unowned string text_get_text ();
		public Poppler.FormTextType text_get_text_type ();
		public bool text_is_password ();
		public bool text_is_rich_text ();
		public void text_set_text (string text);
	}
	[Compact]
	[CCode (copy_function = "poppler_form_field_mapping_copy", type_id = "POPPLER_TYPE_FORM_FIELD_MAPPING", cheader_filename = "poppler.h")]
	public class FormFieldMapping {
		public weak Poppler.Rectangle area;
		public weak Poppler.FormField field;
		public Poppler.FormFieldMapping copy ();
		[CCode (has_construct_function = false)]
		public FormFieldMapping ();
	}
	[Compact]
	[CCode (copy_function = "poppler_image_mapping_copy", type_id = "POPPLER_TYPE_IMAGE_MAPPING", cheader_filename = "poppler.h")]
	public class ImageMapping {
		public weak Poppler.Rectangle area;
		public weak Gdk.Pixbuf image;
		public Poppler.ImageMapping copy ();
		[CCode (has_construct_function = false)]
		public ImageMapping ();
	}
	[Compact]
	[CCode (copy_function = "poppler_index_iter_copy", type_id = "POPPLER_TYPE_INDEX_ITER", cheader_filename = "poppler.h")]
	public class IndexIter {
		public Poppler.IndexIter copy ();
		public unowned Poppler.Action get_action ();
		public unowned Poppler.IndexIter get_child ();
		public bool is_open ();
		[CCode (has_construct_function = false)]
		public IndexIter (Poppler.Document document);
		public bool next ();
	}
	[Compact]
	[CCode (copy_function = "poppler_link_mapping_copy", type_id = "POPPLER_TYPE_LINK_MAPPING", cheader_filename = "poppler.h")]
	public class LinkMapping {
		public weak Poppler.Action action;
		public weak Poppler.Rectangle area;
		public Poppler.LinkMapping copy ();
		[CCode (has_construct_function = false)]
		public LinkMapping ();
	}
	[CCode (cheader_filename = "poppler.h")]
	public class PSFile : GLib.Object {
		public void free ();
		[CCode (has_construct_function = false)]
		public PSFile (Poppler.Document document, string filename, int first_page, int n_pages);
		public void set_duplex (bool duplex);
		public void set_paper_size (double width, double height);
	}
	[CCode (cheader_filename = "poppler.h")]
	public class Page : GLib.Object {
		public unowned GLib.List find_text (string text);
		public static void free_form_field_mapping (GLib.List list);
		public static void free_image_mapping (GLib.List list);
		public static void free_link_mapping (GLib.List list);
		public void get_crop_box (Poppler.Rectangle rect);
		public double get_duration ();
		public unowned GLib.List get_form_field_mapping ();
		public unowned GLib.List get_image_mapping ();
		public int get_index ();
		public unowned GLib.List get_link_mapping ();
		public unowned Gdk.Region get_selection_region (double scale, Poppler.SelectionStyle style, Poppler.Rectangle selection);
		public void get_size (out double width, out double height);
		public unowned string get_text (Poppler.SelectionStyle style, Poppler.Rectangle rect);
		public unowned Gdk.Pixbuf get_thumbnail ();
		public bool get_thumbnail_size (int width, int height);
		public unowned Poppler.PageTransition get_transition ();
		public void render (Cairo.Context cairo);
		public void render_selection (Cairo.Context cairo, Poppler.Rectangle selection, Poppler.Rectangle old_selection, Poppler.SelectionStyle style, Gdk.Color glyph_color, Gdk.Color background_color);
		public void render_selection_to_pixbuf (double scale, int rotation, Gdk.Pixbuf pixbuf, Poppler.Rectangle selection, Poppler.Rectangle old_selection, Poppler.SelectionStyle style, Gdk.Color glyph_color, Gdk.Color background_color);
		public void render_to_pixbuf (int src_x, int src_y, int src_width, int src_height, double scale, int rotation, Gdk.Pixbuf pixbuf);
		public void render_to_ps (Poppler.PSFile ps_file);
		[NoAccessorMethod]
		public string label { owned get; }
	}
	[Compact]
	[CCode (copy_function = "poppler_page_transition_copy", type_id = "POPPLER_TYPE_PAGE_TRANSITION", cheader_filename = "poppler.h")]
	public class PageTransition {
		public Poppler.PageTransitionAlignment alignment;
		public int angle;
		public Poppler.PageTransitionDirection direction;
		public int duration;
		public bool rectangular;
		public double scale;
		public Poppler.PageTransitionType type;
		public Poppler.PageTransition copy ();
		[CCode (has_construct_function = false)]
		public PageTransition ();
	}
	[Compact]
	[CCode (copy_function = "poppler_rectangle_copy", type_id = "POPPLER_TYPE_RECTANGLE", cheader_filename = "poppler.h")]
	public class Rectangle {
		public double x1;
		public double x2;
		public double y1;
		public double y2;
		public Poppler.Rectangle copy ();
		[CCode (has_construct_function = false)]
		public Rectangle ();
	}
	[CCode (cprefix = "POPPLER_ACTION_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum ActionType {
		UNKNOWN,
		GOTO_DEST,
		GOTO_REMOTE,
		LAUNCH,
		URI,
		NAMED,
		MOVIE
	}
	[CCode (cprefix = "POPPLER_BACKEND_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum Backend {
		UNKNOWN,
		SPLASH,
		CAIRO
	}
	[CCode (cprefix = "POPPLER_DEST_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum DestType {
		UNKNOWN,
		XYZ,
		FIT,
		FITH,
		FITV,
		FITR,
		FITB,
		FITBH,
		FITBV,
		NAMED
	}
	[CCode (cprefix = "POPPLER_ERROR_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum Error {
		INVALID,
		ENCRYPTED
	}
	[CCode (cprefix = "POPPLER_FONT_TYPE_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum FontType {
		UNKNOWN,
		TYPE1,
		TYPE1C,
		TYPE1COT,
		TYPE3,
		TRUETYPE,
		TRUETYPEOT,
		CID_TYPE0,
		CID_TYPE0C,
		CID_TYPE0COT,
		CID_TYPE2,
		CID_TYPE2OT
	}
	[CCode (cprefix = "POPPLER_FORM_BUTTON_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum FormButtonType {
		PUSH,
		CHECK,
		RADIO
	}
	[CCode (cprefix = "POPPLER_FORM_CHOICE_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum FormChoiceType {
		COMBO,
		LIST
	}
	[CCode (cprefix = "POPPLER_FORM_FIELD_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum FormFieldType {
		UNKNOWN,
		BUTTON,
		TEXT,
		CHOICE,
		SIGNATURE
	}
	[CCode (cprefix = "POPPLER_FORM_TEXT_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum FormTextType {
		NORMAL,
		MULTILINE,
		FILE_SELECT
	}
	[CCode (cprefix = "POPPLER_ORIENTATION_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum Orientation {
		PORTRAIT,
		LANDSCAPE,
		UPSIDEDOWN,
		SEASCAPE
	}
	[CCode (cprefix = "POPPLER_PAGE_LAYOUT_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum PageLayout {
		UNSET,
		SINGLE_PAGE,
		ONE_COLUMN,
		TWO_COLUMN_LEFT,
		TWO_COLUMN_RIGHT,
		TWO_PAGE_LEFT,
		TWO_PAGE_RIGHT
	}
	[CCode (cprefix = "POPPLER_PAGE_MODE_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum PageMode {
		UNSET,
		NONE,
		USE_OUTLINES,
		USE_THUMBS,
		FULL_SCREEN,
		USE_OC,
		USE_ATTACHMENTS
	}
	[CCode (cprefix = "POPPLER_PAGE_TRANSITION_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum PageTransitionAlignment {
		HORIZONTAL,
		VERTICAL
	}
	[CCode (cprefix = "POPPLER_PAGE_TRANSITION_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum PageTransitionDirection {
		INWARD,
		OUTWARD
	}
	[CCode (cprefix = "POPPLER_PAGE_TRANSITION_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum PageTransitionType {
		REPLACE,
		SPLIT,
		BLINDS,
		BOX,
		WIPE,
		DISSOLVE,
		GLITTER,
		FLY,
		PUSH,
		COVER,
		UNCOVER,
		FADE
	}
	[CCode (cprefix = "POPPLER_PERMISSIONS_", has_type_id = "0", cheader_filename = "poppler.h")]
	[Flags]
	public enum Permissions {
		OK_TO_PRINT,
		OK_TO_MODIFY,
		OK_TO_COPY,
		OK_TO_ADD_NOTES,
		FULL
	}
	[CCode (cprefix = "POPPLER_SELECTION_", has_type_id = "0", cheader_filename = "poppler.h")]
	public enum SelectionStyle {
		GLYPH,
		WORD,
		LINE
	}
	[CCode (cprefix = "POPPLER_VIEWER_PREFERENCES_", has_type_id = "0", cheader_filename = "poppler.h")]
	[Flags]
	public enum ViewerPreferences {
		UNSET,
		HIDE_TOOLBAR,
		HIDE_MENUBAR,
		HIDE_WINDOWUI,
		FIT_WINDOW,
		CENTER_WINDOW,
		DISPLAY_DOC_TITLE,
		DIRECTION_RTL
	}
	[CCode (cheader_filename = "poppler.h", has_target = false)]
	public delegate bool AttachmentSaveFunc (string buf, size_t count, void* data, GLib.Error error);
	[CCode (cheader_filename = "poppler.h")]
	public const int HAS_CAIRO;
	[CCode (cheader_filename = "poppler.h")]
	public static GLib.Quark error_quark ();
	[CCode (cheader_filename = "poppler.h")]
	public static Poppler.Backend get_backend ();
	[CCode (cheader_filename = "poppler.h")]
	public static unowned string get_version ();
}
