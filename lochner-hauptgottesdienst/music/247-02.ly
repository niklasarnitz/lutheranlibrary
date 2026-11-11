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
      \new Voice = "soprano" { \voiceOne f'2 g'2 \bar "|" f'1 \bar "|" c''2 c''2 \bar "|" d''2 c''2 \bar "|" d''4 c''4 d''2 \bar "|" e''2 f''2\fermata \bar "|" c''2 bes'2 \bar "|" c''2 f'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 bes2 a1 e'2 c'2 f'2 f'2 f'4 f'4 d'2 g'2 a'2 f'2 d'2 e'2 d'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Ze -- ba -- "oth:" Al -- le Welt ist sei -- ner Eh -- re "voll." Ho -- si -- an -- na }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne bes2 d'2 d'1 g2 a2 bes2 a2 bes4 c'4 bes2 bes2 c'2 a2 bes2 g4.( a8 bes4) a4 }
      \new Voice = "bass" { \voiceTwo bes,2 g,2 d1 c2 f2 bes,2 f2 bes4 a4 g2 g2 f2 f2 g2 c2 d2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
