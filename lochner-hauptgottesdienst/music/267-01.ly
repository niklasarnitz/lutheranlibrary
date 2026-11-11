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
      \new Voice = "melody" { a'1 g'\breve( a'\breve) g'\breve \bar "|" g'1 g'1 g'1 g'1 g'1 a'1 bes'\breve a'\breve s2 g'\breve f'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t ge -- sche -- \skip 1 "he," wie im Him -- "mel," al -- so auch auf Er -- "den." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <c' f' a'>1 <c' e' g'>\breve( <c' f' a'>\breve) <c' e' g'>\breve \bar "|" <d' g'>1 r1 r1 r1 r1 r1 <d' g' bes'>\breve <c' f' a'>\breve f'2 << { <c' g'>\breve } \\ { s1 e'1 } >> <c' f'>\breve }
      \new Staff { \clef bass \global f1 c\breve( f\breve) c\breve \bar "|" <bes, g>1 r1 r1 r1 r1 r1 g,\breve a,1( bes,1) s2 c\breve <f, a>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
