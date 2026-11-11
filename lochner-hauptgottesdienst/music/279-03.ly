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
      \new Voice = "melody" { g'1 bes'1 bes'\breve \bar "|" g'1 g'1 bes'\breve bes'1 bes'1 a'1 g'1 a'1 a'1 a'\breve \bar "|" g'1 a'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t -sta -- men -- "tes," das für euch und für viel ver -- gos -- sen wird zur "Ver-" }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' g'>1 <d' bes'>1 <d' bes'>\breve \bar "|" r1 r1 r1*2 r1 r1 <fis' a'>1 g'1 <fis'! a'>1 r1 <fis'! a'>\breve \bar "|" <d' g'>1 <f' a'>1 }
      \new Staff { \clef bass \global <g bes>1 g1 g\breve \bar "|" r1 r1 r1*2 r1 r1 <d d'>1 <g bes>1 <d d'>1 r1 <d d'>\breve \bar "|" <g bes>1 <f c'>1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
