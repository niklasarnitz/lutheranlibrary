\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 271, printed p. 246.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 110\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { f'\breve f'\breve f'\breve f'\breve \bar "|" f'\breve f'\breve f'\breve \bar "||"  }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Das ist mein "Leib &c." Die -- ser "Kelch &c." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <c' f'>\breve <d' f'>\breve <d' f'>\breve <c' f'>\breve \bar "|" <c' f'>\breve <d' f'>\breve <c' f'>\breve \bar "||"  }
      \new Staff { \clef bass \global <f a>\breve <d a>\breve <bes, bes>\breve <f, a>\breve \bar "|" <f a>\breve <bes, bes>\breve <f, a>\breve \bar "||"  }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
