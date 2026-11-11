\version "2.24.3"
% Scan 300, printed p. 275: Benedictio, congregational triple Amen.
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
        \new Voice = "sung" { \voiceOne g'1( fis'2) g'2 \bar "|" g'1 g'1 \bar "|"
          fis'!2( g'2 a'1) g'1 \bar "||" }
        \new Voice { \voiceTwo d'1. d'2 e'1 d'1 d'2( b2 d'1) d'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "A : : :" \skip 1 "men." "A : :" "men."
        "A : : : : : : :" \skip 1 \skip 1 "men."
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne b1( a2) b2 c'1 b1 a2( g1 fis4 e4) b1 }
        \new Voice { \voiceTwo g1( d2) g,2 c1 g,1 d2( e2 d1) g,1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
