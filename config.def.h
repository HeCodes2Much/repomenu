/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;   /* -b  option; if 0, instamenu appears at bottom     */
static int centered = 0; /* -c option; centers dmenu on screen */
static int followcursor = 0; /* -c option; centers dmenu on screen */
static int min_width = 500;  /* minimum width when centered */

static int instant = 0;
static int spaceconfirm = 0;
static int fuzzy = 1;
static int prematch = 0;
static int exact = 0;
static int smartcase = 0;
static int sely = 0;
static int managed = 0;
static int animated = 0;
static int framecount = 7;
static int fullheight = 0;
static unsigned int lineheight = 0; /* -h option; minimum height of a menu line     */
static int commented = 0;

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "Misc Termsyn:size=12",
    "Cantarell-Regular:size=12",
    "FiraCode Nerd Font:size=14",
    "Siji:size=14",
    "JoyPixels:pixelsize=20:antialias=true:autohint=true",
    "MaterialIcons:size=10",
    "xos4 Terminus:size=12"};

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *searchtext =
    NULL; /* -p  option; prompt to the left of input field */
static const char *leftcmd =
    NULL; /* -p  option; prompt to the left of input field */
static const char *rightcmd =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][12] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#bd93f9", "#282a36", "#282a36"},
    [SchemeFade] = {"#575E70", "#282a36", "#3E485B"},
    [SchemeHighlight] = {"#f1fa8c", "#596377", "#3E485B"},
    [SchemeHover] = {"#ffffff", "#353D4B", "#3E485B"},
    [SchemeSel] = {"#f8f8f2", "#6272a4", "#6272a4"},
    [SchemeOut] = {"#44475a", "#6272a4", "#6272a4"},
    [SchemeMid] = {"#A4ABAA", "#21222c", "#21222c"},
    [SchemeGreen] = {"#ffffff", "#52E067", "#41b252"},
    [SchemeRed] = {"#ffffff", "#e05252", "#c24343"},
    [SchemeYellow] = {"#ffffff", "#e0c452", "#bca33f"},
    [SchemeBlue] = {"#ffffff", "#5280e0", "#3a62b3"},
    [SchemePurple] = {"#ffffff", "#9952e0", "#7439b0"},
};

/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines = 0;
static unsigned int columns = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* -ps option; preselected item starting from 0 */
static unsigned int preselected = 0;

/* Size of the window border */
static unsigned int border_width = 4;
