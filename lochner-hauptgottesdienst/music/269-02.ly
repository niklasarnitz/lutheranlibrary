\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 269, printed p. 244.
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
      \new Voice = "melody" { a'1 bes'1 a'1 a'\breve \bar "|" a'1 g'1 a'\breve \bar "|" a'1 a'1 a'1 a'1 c''\breve b'\breve a'1 a'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t nahm er das "Brod," dankt und "brach’s," und "gab’s" sei -- nen Jün -- gern und "sprach:" }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 <c' f' a'>\breve \bar "|" r1 r1 <f' a'>\breve \bar "|" r1 r1 r1 r1 <e' a' c''>\breve <e' gis' b'>\breve r1 <c' e' a'>\breve }
      \new Staff { \clef bass \global r1 r1 r1 f\breve \bar "|" r1 r1 <f c'>\breve \bar "|" r1 r1 r1 r1 a,1( c1) e\breve r1 a,\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
