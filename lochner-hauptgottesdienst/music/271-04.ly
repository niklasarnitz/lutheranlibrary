\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 271, printed p. 246.
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
      \new Voice = "pastor" { a'1 a'1 f'1 g'1 a'\breve g'\breve \bar "|" g'1 a'1 a'1 a'1 bes'1 a'1 g'1 g'\breve a'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t der du bist im Him -- "mel." Ge -- hei -- li -- get wer -- de dein Na -- "me." }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 <d' f'>1 <e' g'>1 <f' g' a'>\breve <e' f' g'>\breve \bar "|" r1 r1 r1 r1 <d' f' bes'>1 <c' f' a'>1 r1 <c' d' f' g'>\breve <c' f' g' a'>\breve }
      \new Staff { \clef bass \global r1 r1 <d a>1 <c c'>1 <f c'>\breve <c c'>\breve \bar "|" r1 r1 r1 r1 bes,1 f1 r1 c\breve f\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
