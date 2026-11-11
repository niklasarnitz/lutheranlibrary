\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 272, printed p. 247.
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
      \new Voice = "pastor" { bes'1 a'1 g'1 g'1 g'\breve a'\breve \bar "|" g'1 a'1 a'1 a'1 a'1 a'1 f'1 g'1 a'\breve g'\breve \bar "||"  }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t uns nicht in Ver -- su -- "chung." Son -- dern er -- lö -- se uns von dem Ue -- "bel." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' f' bes'>1 <c' f' a'>1 r1 r1 <c' e' g'>\breve <c' f' g' a'>\breve \bar "|" <c' e' g'>1 <c' f' a'>1 r1 r1 r1 r1 <d' f'>1 <e' g'>1 <f' g' a'>\breve <e' f' g'>\breve \bar "||"  }
      \new Staff { \clef bass \global bes,1 f1 r1 r1 c\breve f\breve \bar "|" c1 f1 r1 r1 r1 r1 <d a>1 <c c'>1 <f c'>\breve <c c'>\breve \bar "||"  }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
