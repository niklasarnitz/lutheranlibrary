\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed pages 182–183.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne a'4 a'4 b'4 a'4 \bar "|" a'2 a'2 \bar "|" fis'2( gis'2) \bar "|" a'1 \bar "|" a'2 b'2 \bar "|" a'2 a'4 a'4 \bar "|" fis'2( e'2) \bar "|" d'1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'4 fis'4 g'4 e'4 fis'2 cis'2 d'2( e'2) cis'1 d'2 d'2 cis'2 cis'4 e'4 d'2.( cis'4) a1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Ich be -- ken -- ne Ei -- ne Tau \skip 1 fe zur Ver -- ge -- bung der Sün \skip 1 "den," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne d'4 d'4 d'4 cis'4 d'2 a2 b1 a1 fis2 g2 g2 g4 a4 a1 fis1 }
      \new Voice = "bass" { \voiceTwo d4 d4 g4 a4 d2 fis2 b,2( e2) a,1 d2 g,2 a,2 a,4 cis4 d2( a,2) d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
