\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 273, printed p. 248.
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
      \new Voice = "pastor" { f'1 g'1 a'\breve a'1 g'1 a'1 a'\breve \bar "|" a'1 a'1 a'\breve a'1 a'1 a'1 f'1 g'1 a'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Un -- ser HErr JE -- sus Chri -- "stus," in der "Nacht," da er ver -- ra -- then "ward," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' f'>1 <e' g'>1 <f' g' a'>\breve r1 r1 r1 <e' f' a'>\breve \bar "|" r1 r1 <f' g' a'>\breve r1 r1 r1 <d' f'>1 <e' g'>1 <f' g' a'>\breve }
      \new Staff { \clef bass \global <d a>1 <c c'>1 <f c'>\breve r1 r1 r1 <f c'>\breve \bar "|" r1 r1 <f c'>\breve r1 r1 r1 <d a>1 c1 <f c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
