\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 179.
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
      \new Voice = "soprano" { \voiceOne d''2 cis''2 \bar "|" d''4 cis''4 b'4 cis''4 \bar "|" d''4 a'4 a'2 \bar "|" b'2.( gis'4) \bar "|" a'1 \bar "|" cis''2 e''2 \bar "|" d''2 b'4 b'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2 e'2 fis'4 fis'4 d'4 g'4 fis'4 e'4 fis'2 fis'2.( e'4) e'1 a'2 a'2 a'2 g'4 g'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Fleisch ge -- wor -- den ist vom Hei -- li -- gen Gei \skip 1 ste aus Ma -- ri -- a der }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a2 a4 a4 b4 g4 a4 a4 a2 d'2.( b4) cis'1 e'2 cis'2 d'2 d'4 d'4 }
      \new Voice = "bass" { \voiceTwo d2 a,2 d4 fis4 g4 e4 d4 cis4 d2 b,2.( e4) a,1 a2 a2 fis2 g4 g4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
