# This package contains the build rule to build elemental2-webgl2.

package(
    default_visibility = [
        "//:__subpackages__",
    ],
    # Apache2
    licenses = ["notice"],
)

load("//build_defs/internal_do_not_use:elemental_utils.bzl", "patch_extern_file")
load("@com_google_jsinterop_generator//:jsinterop_generator.bzl", "jsinterop_generator")

# Patch for webgl2.js as closure attempts to override methods in a way incompatible with java
# It may be necessary to extend jsinterop-generator to support this scenario
patch_extern_file(
    name = "webgl2_patched",
    src = "//third_party:webgl2.js",
    patch_file = "webgl2.js.diff",
)

filegroup(
    name = "externs",
    srcs = [":webgl2_patched"],
)

jsinterop_generator(
    name = "webgl2",
    srcs = [":externs"],
    extension_type_prefix = "WebGl2",
    integer_entities_files = ["integer_entities.txt"],
    # override auto generated js_deps in order not to provide extern files
    # Common extern file are included by default.
    j2cl_js_deps = [],
    deps = [
        "//java/elemental2/core",
        "//java/elemental2/dom",
        "//java/elemental2/webgl",
    ],
)
