\version "2.24.3"
% Scan 181, printed p. 156: Epistelton, denn daß ... a-ber dar-; continuation scan 182.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm paper-height = 155\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 0\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new Staff { \new Voice = "melody" { \clef treble \key g \major \cadenzaOn \override Stem.stencil = ##f
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
    g'1 g'1 g'1 g'1 g'1 b'1 a'1 a'1 g'\breve \bar "|"
    d'1 g'1 g'1 g'1 g'1 fis'1 g'1 g'1 \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," \break
    g'1 g'1 g'1 g'1 g'1 g'1 a'1 a'1 g'\breve \bar "|"
    g'1 g'1 g'1 g'1 g'1 b'1 a'1 a'1 a'1 g'\breve \bar "|" \break
    d'1 g'1 g'1 b'1 a'1 a'1 g'1 g'\breve \bar "|"
    d'1 g'1 g'1 g'1 g'1 fis'1 g'\breve \bar "|"
    d'1 d'1 g'1 } }
  \new Lyrics \lyricsto "melody" { denn daß sie treu "er :" "fun :" den "wer :" den.
    Mir "a :" ber ist's ein "Ge :" "rin :" ges,
    daß ich von euch "ge :" "rich :" tet "wer :" de,
    "o :" der von "ei :" nem "mensch :" "li :" chen "Ta :" ge;
    auch "rich :" te ich mich "sel :" ber nicht.
    Ich bin mir wohl nichts "be :" wußt,
    "a :" ber "dar :" }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
