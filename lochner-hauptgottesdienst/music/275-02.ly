\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 275, printed p. 250.
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
      \new Voice = "pastor" { a'1 a'1 a'1 a'1 bes'1 a'1 a'\breve a'1 a'1 a'\breve f'1 g'1 a'\breve g'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t das für euch ver -- gos -- sen wird zur Ver -- ge -- bung der Sün -- "den." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <f' a'>1 r1 r1 r1 <f' bes'>1 r1 <f' g' a'>\breve r1 r1 <f' g' a'>\breve <d' f'>1 <e' g'>1 <f' g' a'>\breve <e' f' g'>\breve }
      \new Staff { \clef bass \global <d d'>1 r1 r1 r1 <bes, d'>1 r1 <f c'>\breve r1 r1 <f c'>\breve <d a>1 <c c'>1 <f c'>\breve <c c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
