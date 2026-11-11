\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 267, printed p. 242.
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
      \new Voice = "melody" { c''\breve( b'\breve) a'\breve \bar "|" f'1 f'1 f'1 bes'1 \tweak Accidental.stencil ##f bes'1 \tweak Accidental.stencil ##f bes'\breve \tweak Accidental.stencil ##f bes'1 a'1 s2 g'\breve f'\breve \bar "||"  }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t su -- \skip 1 "chung." Son -- dern er -- lö -- se uns von dem Ue -- "bel." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <e' c''>\breve( <e' b'>\breve) <c' a'>\breve \bar "|" <d' a'>1 r1 r1 <d' bes'>\breve( <d' bes'>\breve) <b e' bes'>1 <c' f' a'>1 f'2 << { <c' g'>\breve } \\ { s1 e'1 } >> <c' f'>\breve \bar "||"  }
      \new Staff { \clef bass \global << { \voiceOne a\breve( a1) gis1 a\breve } \\ { \voiceTwo a,1( c1) e\breve a,\breve } >> \bar "|" <d g>1 r1 r1 <g, a>\breve( <g, a>\breve) g,1 a,1 s2 c\breve <f, a>\breve \bar "||"  }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
