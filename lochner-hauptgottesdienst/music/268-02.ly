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
      \new Voice = "melody" { \voiceOne a'2 g'2 g'1( \bar "|" g'2) g'2 g'2 fis'2 \bar "|" g'1 g'1 \bar "|" g'1\fermata \bar "||"  }
      \new Voice { \voiceTwo f'2 e'2 d'1( d'2) ees'2 d'2 d'2 d'1 e'!1 d'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Herr -- lich -- keit \skip 1 in E -- wig -- "keit." A -- "men." }
    \new Staff <<
      \clef bass \global
      \new Voice { \voiceOne c'2 c'2 b1( b2) c'2 bes2 a2 b!1 c'1 b!1 }
      \new Voice { \voiceTwo f2 c2 g1( g2) c2 d2 d2 g,1 c1 g,1_\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
