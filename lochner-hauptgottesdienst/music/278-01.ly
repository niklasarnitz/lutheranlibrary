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
      \new Voice = "melody" { bes'1 bes'\breve bes'1 a'1( g'1) g'1( a'1) a'\breve \bar "|" a'1 bes'\breve g'1 g'1 f'1( g'1) bes'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t das "Brod," dan -- ket \skip 1 und \skip 1 "brach’s," und "gab’s" sei -- nen Jün -- \skip 1 gern }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 <g' a' bes'>\breve r1 r1 r1 r1 r1 <fis' a'>\breve \bar "|" <fis' a'>1 <d' bes'>\breve <ees' g'>1 r1 <d' f'>1 r1 r1*2 }
      \new Staff { \clef bass \global r1 <g, d'>\breve r1 r1 r1 r1 r1 <d d'>\breve \bar "|" <d d'>1 <g bes>\breve <ees bes>1 r1 <bes, bes>1 r1 r1*2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
