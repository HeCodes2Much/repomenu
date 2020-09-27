/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, instantmenu appears at bottom     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int followcursor = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */

static int instant = 0;
static int fuzzy = 1;
static int sely = 0;
static int animated = 0;
static int framecount = 7;
static int fullheight = 0;
static unsigned int lineheight = 0;         /* -h option; minimum height of a menu line     */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Cantarell-Regular:size=12"
};

static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *searchtext      = NULL;      /* -p  option; prompt to the left of input field */
static const char *leftcmd      = NULL;      /* -p  option; prompt to the left of input field */
static const char *rightcmd      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][9] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#A4ABAA", "#292F34" },
	[SchemeFade] = { "#575E70", "#292f3a", "#3E485B" },
	[SchemeHighlight] = { "#ffffff", "#596377", "#3E485B" },
	[SchemeHover] = { "#ffffff", "#353D4B", "#3E485B" },
	[SchemeSel] = { "#ffffff", "#2EB398" },
	[SchemeOut] = { "#000000", "#00ffff" },
	[SchemeGreen] = { "#ffffff", "#52E067", "#35CA4B" },
	[SchemeRed] = { "#ffffff", "#E0527E", "#CA3563" },
	[SchemeYellow] = { "#ffffff", "#E09F52", "#CA8635" },
};

/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 0;
static unsigned int columns    = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* -ps option; preselected item starting from 0 */
static unsigned int preselected = 0;

/* Size of the window border */
static unsigned int border_width = 2;
