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
      \new Voice = "melody" { \voiceOne a'2 \bar "|" f'1 e'2 d'2 \bar "|" e'\breve( \bar "|" e'1) e'2 e'2 \bar "|" f'\breve( \bar "|" f'1) g'2 g'2 }
      \new Voice { \voiceTwo c'2 d'1 c'2 d'2 b\breve( b1) cis'2 cis'2 d'\breve( d'1) e'2 e'2 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Denn dein ist das "Reich," \skip 1 und die "Kraft," \skip 1 und die }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne a2 a1 a2 a2 gis\breve( g1) a2 a2 a\breve( a1) c'2 c'2 }
      \new Voice { \voiceTwo f2 d1 a,2 f2 e\breve( e1) a,2 a,2 d\breve( d1) c2 c2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
