#!/usr/bin/rdmd --shebang -I/home/andy/repos/cairo -L-lcairo 

import deimos.cairo.cairo;

void main() {
    cairo_surface_t *surface;
    cairo_t *cr;

    surface = cairo_image_surface_create (CairoFormat.ARGB32, 120, 120);
    scope(exit) cairo_surface_destroy(surface);

    cr = cairo_create (surface);
    scope(exit) cairo_destroy(cr);

    cairo_set_line_width (cr, 0.1);
    cairo_set_source_rgb (cr, 0, 0, 0);
    cairo_rectangle (cr, 0.25, 0.25, 0.5, 0.5);
    cairo_stroke(cr);

    cairo_set_source_rgb (cr, 0, 0, 0);
    cairo_rectangle (cr, 0.25, 0.25, 0.5, 0.5);
    cairo_fill(cr);

    cairo_surface_write_to_png(surface, "test3");
}
