\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 274, printed p. 249.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { a'1 a'1 bes'1 a'1 g'1 a'\breve a'1 a'1 a'1 g'1 a'\breve \bar "|" bes'\breve a'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t -chen nahm Er auch den "Kelch," nach dem A -- bend -- "mahl," dan -- "ket," }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 <f' a'>1 <d' g'>1 <f' g' a'>\breve r1 r1 <f' a'>1 <e' g'>1 <f' g' a'>\breve \bar "|" <f' bes'>\breve <f' g' a'>\breve }
      \new Staff { \clef bass \global r1 r1 r1 <f c'>1 <g bes>1 <d d'>\breve r1 r1 <f c'>1 <c c'>1 <f c'>\breve \bar "|" <bes, d'>\breve <f c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
