\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 271, printed p. 246.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { g'1 a'1 g'1 g'1 g'\breve f'\breve \bar "||"  }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t zu mei -- nem Ge -- dächt -- "niß." }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 <f' a'>1 <e' g'>1 r1 <e' g'>\breve <c' f'>\breve \bar "||"  }
      \new Staff { \clef bass \global r1 <f c'>1 <c c'>1 r1 <c c'>\breve <f a>\breve \bar "||"  }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
