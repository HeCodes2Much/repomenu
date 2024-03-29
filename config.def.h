/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;   /* -b  option; if 0, repomenu appears at bottom     */
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
    "Source Code Pro:size=10",
    "FiraCode Nerd Font:size=12",
    "remixicon:size=12",
    "Siji:size=12",
    "MaterialIcons:size=10",
    "SourceCodePro Nerd Font:size=10",};

static char *prompt = NULL; /* -p  option; prompt to the left of input field */
static char *searchtext = NULL; /* -p  option; prompt to the left of input field */
static char *leftcmd = NULL; /* -p  option; prompt to the left of input field */
static char *rightcmd = NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][12] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#9059ff", "#283036", "#283036"},
    [SchemeFade] = {"#575E70", "#283036", "#3E485B"},
    [SchemeHighlight] = {"#f1fa8c", "#596377", "#3E485B"},
    [SchemeHover] = {"#9059ff", "#353D4B", "#3E485B"},
    [SchemeSel] = {"#283036", "#81a1c1", "#81a1c1"},
    [SchemeOut] = {"#434c5e", "#81a1c1", "#81a1c1"},
    [SchemeMid] = {"#e5e9f0", "#434c5e", "#434c5e"},
    [SchemeGreen] = {"#283036", "#59ff59", "#a6ffa6"},
    [SchemeRed] = {"#283036", "#ff5959", "#ffa6a6"},
    [SchemeYellow] = {"#283036", "#ffff59", "#ffffa6"},
    [SchemeBlue] = {"#283036", "#59fff9", "#a6fffc"},
    [SchemePurple] = {"#283036", "#9059ff", "#c5a6ff"},
};

/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines = 0;
static unsigned int columns = 1;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* -ps option; preselected item starting from 0 */
static unsigned int preselected = 0;

/* Size of the window border */
static unsigned int border_width = 2;
