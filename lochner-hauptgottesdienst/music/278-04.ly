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
      \new Voice = "melody" { g'1 g'1 g'1 bes'1 bes'1 a'1 g'1 bes'1 bes'1 bes'\breve \bar "|" g'1 g'1 bes'1 bes'1 bes'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Des -- sel -- ben glei -- chen nahm er auch den "Kelch," nach dem A -- bend -- "mahl," }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 r1 r1 <fis' a'>1 r1 <d' bes'>1 r1 <d' bes'>\breve \bar "|" <ees' g'>1 r1 <f' bes'>1 r1 r1 }
      \new Staff { \clef bass \global r1 r1 r1 r1 r1 <d d'>1 r1 g1 r1 g\breve \bar "|" <ees bes>1 r1 <bes, d'>1 r1 r1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
