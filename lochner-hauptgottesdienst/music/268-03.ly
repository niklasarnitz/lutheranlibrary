\version "2.24.3"
% Lochner, Luthers Weise, Vaterunser. PDF scan 268, printed p. 243.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 148\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { \voiceOne e'1 \bar "|" f'1 g'2 g'2 \bar "|" a'1 g'2 f'2 \bar "|" g'1 f'2 f'2 \bar "|" g'1 f'1 \bar "|" e'1 a'2( g'2) }
      \new Voice { \voiceTwo c'1 c'1 e'2 e'2 f'1 e'2 d'2 e'1 c'2 d'2 e'1 f'1 c'1 <c' f'>2( <bes d'>2) }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Denn dein ist das "Reich," und die "Kraft," und die Herr -- lich -- keit in \skip 1 }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne g1 a1 c'2 c'2 c'1 c'2 a2 c'1 a2 a2 c'1 a1 g1 s1 }
      \new Voice { \voiceTwo c1 f1 e2 c2 f1 c2 d2 c1 f2 d2 c1 f1 c1 f,2( g,2) }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
