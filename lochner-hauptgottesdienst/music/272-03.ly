\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 272, printed p. 247.
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
      \new Voice = "pastor" { bes'1 a'1 g'1 a'\breve \bar "|" a'1 a'1 a'1 a'1 a'1 f'1 g'1 a'1 g'1 g'\breve \bar "|" g'1 a'1 a'1 }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t uns uns -- re "Schuld," wie wir ver -- ge -- ben un -- sern Schul -- di -- "gern." Und füh -- re }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 <c' f' g' a'>\breve \bar "|" r1 r1 r1 r1 r1 <d' f'>1 <e' g'>1 <f' a'>1 r1 <e' f' g'>\breve \bar "|" r1 r1 r1 }
      \new Staff { \clef bass \global r1 r1 r1 f\breve \bar "|" r1 r1 r1 r1 r1 <d a>1 <c c'>1 <f c'>1 r1 <c c'>\breve \bar "|" r1 r1 r1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
