\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 279, printed p. 254.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { bes'1( a'1 g'1) f'1( g'1) bes'1 a'1( g'1 a'1) g'\breve \bar "|" g'1 a'1 a'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t -ge -- \skip 1 \skip 1 bung \skip 1 der Sün -- \skip 1 \skip 1 "den." Solchs "thut," so }
    \new PianoStaff <<
      \new Staff { \clef treble \global <f' bes'>1( a'1 <d' g'>1) <d' f'>1( <ees' g'>1) <g' bes'>1 <fis' a'>1( <bes g'>1 <f' a'>1) <g' g'>\breve \bar "|" <d' g'>1 <fis' a'>1~ <fis' a'>1 }
      \new Staff { \clef bass \global <bes, d'>1( <f c'>1 <g bes>1) <d a>1( <c c'>1) <g, d'>1 << { \voiceOne d'1.( d'2 c'1) } \\ { \voiceTwo d\breve s1 } >> <g bes>\breve \bar "|" <g bes>1 <d d'>1~ <d d'>1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
