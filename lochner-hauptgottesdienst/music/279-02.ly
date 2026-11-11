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
      \new Voice = "melody" { bes'1 bes'1 a'1( g'1) g'1( a'1) a'\breve \bar "|" g'\breve g'\breve g'\breve bes'\breve bes'1 bes'1 bes'1 a'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Trinkt al -- le \skip 1 dar -- \skip 1 "aus." Das ist mein "Blut†" des neu -- en "Te-" }
    \new PianoStaff <<
      \new Staff { \clef treble \global <g' bes'>1~ <g' bes'>1 <fis' a'>1 r1 <g' g'>1( <fis' a'>1) <f' g' a'>\breve \bar "|" <g' g'>\breve~ g'\breve~ g'\breve <f' bes'>\breve r1 r1 r1 <f' a'>1 }
      \new Staff { \clef bass \global <g d'>1~ <g d'>1 <d d'>1 r1 <g bes>1( <d d'>1) <d d'>\breve \bar "|" <ees bes>\breve~ <ees bes>\breve~ <ees bes>\breve <bes, d'>\breve r1 r1 r1 <f c'>1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
