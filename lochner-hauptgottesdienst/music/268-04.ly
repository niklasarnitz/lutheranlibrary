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
      \new Voice = "melody" { \voiceOne f'1 e'1 \bar "|" f'\breve\fermata \bar "|" f'1( g'1 \bar "|" a'1 g'1 \bar "|" f'1 e'1) \bar "|" f'\breve \bar "||"  }
      \new Voice { \voiceTwo c'1 c'1 c'\breve d'1( e'1 f'1 d'1 c'\breve) c'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t E -- wig -- "keit." A \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 "men." }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne a1 g1 a\breve a1( c'1 c'1 bes1 a1 g1) a\breve }
      \new Voice { \voiceTwo a,2( bes,2) c1 f,\breve_\fermata d1( c1 f,1 g,1 a,1 c1) f,\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
