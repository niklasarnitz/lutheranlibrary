\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 275, printed p. 250.
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
      \new Voice = "melody" { s1*3 \bar "|" s1*3 \bar "||" g'1 d'1 f'1( g'1) g'\breve \bar "|" f'1 g'1 a'1 a'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Laßt uns be -- \skip 1 "ten!" Va -- ter un -- "ser," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' g'>1.( f'2) <ees' g'>1 \bar "|" <d' g'>1( s1 <d' g'>1) \bar "||" r1 r1 <d' f'>1( <ees' g'>1) <d' g'>\breve \bar "|" <d' f'>1 <e' g'>1 <f' a'>1 r1 }
      \new Staff { \clef bass \global <g bes>1( <d a>1) <c c'>1~ \bar "|" <g c'>1( bes2 a2 <g bes>1) \bar "||" r1 r1 <d a>1( <c c'>1) <g, bes>\breve \bar "|" <d a>1 <c c'>1 <f c'>1 r1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
