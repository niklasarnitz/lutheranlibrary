\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 278, printed p. 253.
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
      \new Voice = "melody" { a'1( g'1 a'1) g'\breve \bar "|" g'1 g'1 bes'\breve a'1( g'1) g'1( a'1) a'\breve \bar "|" g'\breve g'\breve g'\breve bes'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t und \skip 1 \skip 1 "sprach:" Neh -- met hin und \skip 1 es -- \skip 1 "set," das ist mein "Leib†," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <fis' a'>1( <bes g'>1 <f' a'>1) <g' g'>\breve \bar "|" r1 r1 <d' bes'>\breve <d' a'>1 r1 <d' g'>1 r1 <fis' a'>\breve \bar "|" <g' g'>\breve <g' g'>\breve <g' g'>\breve <f' bes'>\breve }
      \new Staff { \clef bass \global <d d'>1.( s2 <d d'>1) <g bes>\breve \bar "|" r1 r1 <g g>\breve <fis a>1 r1 <g bes>1 r1 <d d'>\breve \bar "|" <ees bes>\breve( <ees bes>\breve <ees bes>\breve) <bes, d'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
