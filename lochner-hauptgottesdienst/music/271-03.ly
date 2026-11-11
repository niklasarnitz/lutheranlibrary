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
      \new Voice = "pastor" { s1 s\breve s1 \bar "|" s1 s\breve s1 s1 \bar "|" s\breve \bar "||" g'1 d'1 f'1( g'1) g'\breve \bar "|" f'1 g'1 a'1 a'\breve }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Laßt uns be -- \skip 1 "ten!" Va -- ter un -- "ser," }
    \new PianoStaff <<
      \new Staff { \clef treble \global d'1 g'\breve( ees'1~ \bar "|" ees'1) g'\breve d'1 c'1 \bar "|" <d' g'>\breve \bar "||" r1 r1 <d' f'>1( <ees' g'>1) <d' g'>\breve \bar "|" <d' f'>1 <e' g'>1 <f' a'>1 <f' g' a'>\breve }
      \new Staff { \clef bass \global  <g, bes>1 s\breve <c c'>1~ \bar "|" <c c'>1 s\breve <g, b!>1 a1 \bar "|" <g, b!>\breve \bar "||" r1 r1 <d a>1( <c c'>1) <g, bes>\breve \bar "|" <d a>1 <c c'>1 <f c'>1 <f c'>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
