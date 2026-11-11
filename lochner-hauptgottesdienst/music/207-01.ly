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
      \new Voice = "soprano" { \voiceOne e'1 \bar "|" fis'4 d'4 fis'4 g'4 \bar "|" a'2 b'4 a'4 \bar "|" d'2( e'4) e'4 \bar "|" d'1\fermata \bar "|" fis'2 a'4 a'4 \bar "|" fis'4 fis'4 d'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo cis'1 d'4 a4 d'4 e'4 d'2 d'4 d'4 d'2.( cis'4) a1 a2 cis'4 e'4 d'4 d'4 b2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t "wird," der durch die Pro -- phe -- ten ge -- re \skip 1 det "hat." Ich glau -- be Ei -- ne "hei-" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a1 a4 fis4 b4 b4 a2 g4 fis4 fis2( a4) a4 fis1 fis2 e4 a4 a4 a4 g2 }
      \new Voice = "bass" { \voiceTwo a,1 d4 d4 b,4 e4 fis2 g4 d4 b,2( a,4) a,4 d1\fermata d2 a,4 cis4 d4 d4 g,2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
