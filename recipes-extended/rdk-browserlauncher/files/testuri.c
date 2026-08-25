#include <libsoup/soup.h>
#include <glib.h>

int main (int argc, char *argv[]) {
    // 1. Verify that a URL argument was provided
    if (argc < 2) {
        g_printerr ("Usage: %s <URL>\n", argv[0]);
        return 1;
    }

    char *url_string = argv[1];
    GError *error = NULL;
    GUri *parsed_uri = NULL;

    // 2. Parse and validate the URI using libsoup HTTP flags
    parsed_uri = g_uri_parse (url_string, SOUP_HTTP_URI_FLAGS, &error);

    if (parsed_uri == NULL) {
        g_printerr ("Invalid URL: %s\n", error->message);
        g_error_free (error);
        return 1;
    }

    // 3. Double-check that it uses a valid HTTP(S) or FILE scheme
    const char *scheme = g_uri_get_scheme (parsed_uri);
    if (G_UNLIKELY(scheme == NULL)) {
        g_printerr ("Invalid URL: no scheme\n");
        g_uri_unref (parsed_uri);
        return 1;
    }
    if ((g_strcmp0 (scheme, "http") != 0) && (g_strcmp0 (scheme, "https") != 0) && (g_strcmp0 (scheme, "file") != 0)) {
        g_printerr ("Invalid URL: Scheme must be http(s) or file (got '%s')\n", scheme);
        g_uri_unref (parsed_uri);
        return 1;
    }

    // 4. Clean up and print success
    g_print ("Valid HTTP(S)/FILE URL!\n");
    g_print ("   Scheme: %s\n", scheme);
    g_print ("   Host:   %s\n", g_uri_get_host (parsed_uri));
    g_print ("   Path:   %s\n", g_uri_get_path (parsed_uri));

    g_uri_unref (parsed_uri);
    return 0;
}

