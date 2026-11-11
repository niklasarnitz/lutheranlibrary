\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 277, printed p. 252.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { <c' f' a'>1 <d' f' bes'>1 <c' f' a'>1 <d' g'>1 <c' f' g' a'>\breve \bar "|" <c' e' g'>1 <d' f'>1 <c' e' f' g'>\breve \bar "|" <c' f'>1 <c' e' g'>1 <c' f' a'>1 <d' g'>1 <d' g'>1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Denn dein ist das "Reich," und die "Kraft," und die Herr -- lich -- keit }
    \new Staff { \clef bass \global f1 bes,1 f1 <g bes>1 f\breve \bar "|" c1 <d a>1 c\breve \bar "|" <f a>1 c1 f1 <g bes>1 <g bes>1 }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
