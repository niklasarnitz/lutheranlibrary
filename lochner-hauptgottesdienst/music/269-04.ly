\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 269, printed p. 244.
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
      \new Voice = "melody" { g'1 g'1 g'\breve g'1 e'1 f'1 g'\breve \bar "|" g'1 a'1 g'1 g'1 g'\breve f'\breve\fermata \bar "|" r1 \bar "|" c''1 c''1 a'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Sol -- ches thut "(, so" oft "ihr’s" "thut,)" zu mei -- nem Ge -- dächt -- "niß." Des -- sel -- ben }
    \new PianoStaff <<
      \new Staff { \clef treble \global <e' g'>1 r1 <d' g'>\breve r1 <c' e'>1 <c' f'>1 <e' g'>\breve \bar "|" r1 r1 r1 r1 <e' g'>\breve <c' f'>\breve \bar "|" <g' c''>1\fermata~ \bar "|" <g' c''>1 <f' c''>1 <f' a'>1 }
      \new Staff { \clef bass \global <c c'>1 r1 <g, b!>\breve r1 <c g>1 <f a>1 <c c'>\breve \bar "|" r1 r1 r1 r1 <c c'>\breve <f a>\breve \bar "|" <d c'>1_\fermata~ \bar "|" <d c'>1( <f a>1) <f c'>1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
