\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 273, printed p. 248.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/2 \cadenzaOn }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { \voiceOne f'1 \bar "|" bes'1 bes'2 bes'2 \bar "|" c''\breve \bar "|" c''1 bes'1 \bar "|" a'\breve \bar "|" a'1 g'1 }
      \new Voice { \voiceTwo f'1 \bar "|" f'1 g'2 g'2 \bar "|" g'\breve \bar "|" f'1 d'2( e'2) \bar "|" f'\breve \bar "|" f'1 e'1 }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Denn dein ist das "Reich," und die "Kraft," und die }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne a1 \bar "|" d'1 d'2 d'2 \bar "|" c'\breve \bar "|" a1 bes1 \bar "|" c'\breve \bar "|" c'1 c'1 }
      \new Voice { \voiceTwo f1 \bar "|" bes,1 g2 f2 \bar "|" e\breve \bar "|" f1 g1 \bar "|" f\breve \bar "|" f,1 c1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
