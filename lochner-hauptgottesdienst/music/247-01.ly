\version "2.24.3"
% Lochner, IV. Sanctus. Source pages 221–222.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''2 c''2 \bar "|" f'2 bes'2 \bar "|" a'2 g'2 \bar "|" g'2 f'2 \bar "||" a'2 a'2 \bar "|" g'2 a'4 a'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2 e'2 d'2 d'2 f'2 d'2 e'2 c'2 c'2 f'2 d'2 f'4 f'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t hei -- lig ist "Gott," der Heil -- ge "Geist." Er ist der HEr -- re }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 g4.( a8 bes4) a4 g2 c'2 bes2 g2 a2 a2 d'2 bes2 c'4 c'4 }
      \new Voice = "bass" { \voiceTwo f2 c2 d2 g,2 a,2 bes,2 c2 f2 f2 d2 g2 f4 f,4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
