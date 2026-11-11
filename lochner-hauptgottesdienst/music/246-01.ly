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
      \clef treble \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne f'2 a'2 \bar "|" bes'4 c''2 c''4 \bar "|" d''2 c''2 \bar "|" c''2 a'2 \bar "|" bes'4 c''2 b'!4 \bar "|" c''1 \bar "|" }
      \new Voice = "alto" { \voiceTwo c'2 f'2 f'4 e'2 f'4 f'2 f'2 e'2 c'2 f'4 g'2 g'4 g'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Hei -- lig ist "Gott," der Va -- "ter," hei -- lig ist "Gott," der "Sohn," }
    \new Staff <<
      \clef bass \global \cadenzaOn
      \new Voice { \voiceOne a2 c'2 d'4 g2 a4 bes2 a2 g2 a2 d'4 e'2 d'4 c'1 }
      \new Voice = "bass" { \voiceTwo f2 f2 d4 c2 f4 bes,2 f2 c2 f2 d4 c2 g,4 bes,1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
