
FROM ghcr.io/massimo-nocentini/chicken-scheme.docker:5.4.0

RUN chicken-install -sudo scheme-indent srfi-1 srfi-18 srfi-69 srfi-19 srfi-133 s11n datatype spiffy matchable miscmacros r7rs csv-abnf sxml-transforms 

