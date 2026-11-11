\version "2.24.3"
% Scan 300, printed p. 275: Benedictio, first congregational Amen.
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
        \new Voice = "sung" { \voiceOne e'2( g'2) g'1 \bar "||" }
        \new Voice { \voiceTwo c'1 b1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "A : : :" \skip 1 "men."
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne g1 g1 }
        \new Voice { \voiceTwo c1 g,1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
