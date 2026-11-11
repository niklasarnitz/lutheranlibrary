\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 270, printed p. 245.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { e'1 f'\breve \bar "|" f'1 f'1 a'\breve g'\breve g'1 g'\breve f'\breve \bar "|" g'1 g'1 g'1 g'1 e'\breve f'\breve g'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t -sen wird zur Ver -- ge -- bung der Sün -- "den." Sol -- ches "thut," so oft "ihr’s" "trinkt," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <c' e'>1 <c' f'>\breve \bar "|" r1 r1 <f' a'>\breve <e' g'>\breve r1 <e' g'>\breve <c' f'>\breve \bar "|" r1 r1 r1 r1 <c' e'>\breve <c' f'>\breve <e' g'>\breve }
      \new Staff { \clef bass \global <c g>1 <f a>\breve \bar "|" r1 r1 <f c'>\breve <c c'>\breve r1 <c c'>\breve <f a>\breve \bar "|" r1 r1 r1 r1 <c g>\breve <f a>\breve <c c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
