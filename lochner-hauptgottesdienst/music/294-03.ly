\version "2.24.3"
% Scan 294, printed p. 269: Dankcollecte, first congregational Amen.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble  \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne e'2( f'2 e'1 d'1) e'1 \bar "||" }
        \new Voice { \voiceTwo c'2( c'2 c'1. b2) c'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "A : : : : : :" \skip 1 \skip 1 \skip 1 "men."
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne g2( a2 g1 g1) g1 }
        \new Voice { \voiceTwo c2( f,2 c1 g,1) c1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
