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
      \new Voice = "pastor" { a'1 f'1 g'1 a'1 g'1 g'\breve \bar "|" bes'1 a'1 a'\breve g'1 a'1 bes'1 a'1 g'1 g'1 a'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t gab ih -- nen den und "sprach:" Neh -- met hin und trin -- ket al -- le dar -- "aus." }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 <d' f'>1 r1 <f' a'>1 r1 <e' f' g'>\breve \bar "|" <f' bes'>1 r1 <f' g' a'>\breve r1 r1 r1 <f' a'>1 <e' g'>1 r1 <f' g' a'>\breve }
      \new Staff { \clef bass \global r1 <d a>1 r1 <f c'>1 r1 <c c'>\breve \bar "|" <bes, d'>1 r1 <f c'>\breve r1 r1 r1 <f c'>1 <c c'>1 r1 <f c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
