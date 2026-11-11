\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 275, printed p. 250.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { g'1 g'1 a'\breve \bar "|" bes'1 a'1 g'1 f'\breve d'1 f'1 f'1 g'1 a'\breve g'\breve \bar "||"  }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Sol -- ches "thut," so oft "ihr’s" "trinkt," zu mei -- nem Ge -- dächt -- "niß." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <e' g'>1 r1 <f' g' a'>\breve \bar "|" <f' bes'>1 <f' a'>1 <d' g'>1 <d' f'>\breve <d' d'>1 <d' f'>1 r1 <e' g'>1 <f' g' a'>\breve <e' f' g'>\breve \bar "||"  }
      \new Staff { \clef bass \global <c c'>1 r1 <f c'>\breve \bar "|" <bes, d'>1 <d d'>1 <g bes>1 <d a>\breve <g bes>1 <d a>1 r1 <c c'>1 <f c'>\breve <c c'>\breve \bar "||"  }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
