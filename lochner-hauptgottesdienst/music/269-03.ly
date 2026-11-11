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
      \new Voice = "melody" { f'1 f'1 f'1 f'1 g'\breve f'\breve \bar "|" f'\breve f'\breve e'\breve f'\breve \bar "|" f'1 f'1 a'1 g'1 g'\breve f'1 f'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Neh -- met hin und es -- "set." Das ist mein "†Leib," der für euch ge -- ge -- ben "wird." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' f'>1 r1 r1 r1 <e' g'>\breve <c' f'>\breve \bar "|" <c' f'>\breve <d' f'>\breve <c' e'>\breve <c' f'>\breve \bar "|" r1 r1 r1 r1 <c' e' g'>\breve r1 <c' f'>\breve }
      \new Staff { \clef bass \global <d a>1 r1 r1 r1 <c c'>\breve <f a>\breve \bar "|" <f a>\breve <bes, bes>\breve <c g>\breve <f, a>\breve \bar "|" r1 r1 r1 r1 c\breve r1 <f a>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
