\version "2.24.3"
\pointAndClickOff

% Lochner, Hauptgottesdienst, p. 203, Offertorium, scan 228.
% First two printed systems only; this excerpt ends on "die".
% Four sounding parts are soprano/alto on the upper staff and tenor/bass below.
% The first "zu" in system 2 is a shared E4 head for S and A, not two heads.

#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

global = { \key d \major \time 4/4 }

soprano = \relative a' {
  \global
  a2 fis4 g4 | a2 r4 a4 | b2 b4 cis4 | \break d4 b4 a2 | a2 r2 | b2 b4 b4 \break
  a2 a2 | \once \stemDown e4 fis4 g4 a4 | \break fis2 r4 fis4 | g4 fis4 e4 a4 | b2 a4 cis4 \bar "|"
}

alto = \relative e' {
  \global
  e2 d4 d4 | fis2 s4 fis4 | g2 g4 g4 | fis4 e4 e2 | e2 s2 | g2 g4 g4
  fis2 fis2 | s4 d4 e4 e4 | d2 s4 d4 | d4 d4 cis4 d4 | b4( e4) e4 a4
}

tenor = \relative cis' {
  \global
  cis2 a4 b4 | a2 r4 d4 | d2 d4 e4 | a,4 gis4 cis2 | cis2 r2 | d2 d4 d4
  d2 d2 | cis4 a4 b4 cis4 | a2 r4 a4 | b4 a4 a4 a4 | a4( gis4) cis4 e4
}

bass = \relative a, {
  \global
  a2 d4 g4 | d2 s4 d4 | g2 g4 e4 | d4 e4 a2 | a2 s2 | g2 g4 g4
  d2 d2 | a'4 fis4 e4 a,4 | d2 s4 d4 | g4 d4 a'4 fis4 | fis2 a,4 a'4
}

words = \lyricmode {
  HErr, thu -- e wohl an Zi -- on nach dei -- ner Gna -- de,
  bau -- e die Mau -- ern zu Je -- ru -- sa -- lem.
  Dann wer -- den dir ge -- fal -- len die
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" <<
      \clef treble
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \lyricsto "soprano" { \words }
    \new Staff = "lower" <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout {
    indent = 0\mm
    ragged-last = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
