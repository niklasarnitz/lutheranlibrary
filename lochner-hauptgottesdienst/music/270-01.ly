\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 270, printed p. 245.
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
      \new Voice = "melody" { a'1 a'1 a'1 g'1 a'\breve \bar "|" a'1 a'1 a'1 g'1 a'\breve \bar "|" a'\breve a'\breve \bar "|" a'1 a'1 a'1 c''\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t glei -- chen auch den "Kelch," nach dem A -- bend -- "mahl," dan -- "ket," gab ih -- nen den }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 <e' g'>1 <f' a'>\breve \bar "|" r1 r1 r1 r1 <c' f' a'>\breve \bar "|" <c' f' a'>\breve <c' f' a'>\breve \bar "|" r1 r1 r1 <e' a' c''>\breve }
      \new Staff { \clef bass \global r1 r1 r1 <c c'>1 <f c'>\breve \bar "|" r1 r1 r1 r1 f\breve \bar "|" f\breve f\breve \bar "|" r1 r1 r1 a,1( c1) }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
