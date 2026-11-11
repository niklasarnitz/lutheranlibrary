\version "2.24.3"
% Scan 300, printed p. 275: Benedictio, congregational double Amen.
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
        \new Voice = "sung" { \voiceOne g'2 a'2\fermata b'2( c''2 b'2 a'2) g'1\fermata \bar "|." }
        \new Voice { \voiceTwo e'2 fis'2 g'2( e'4 fis'4 g'2. fis'!4) d'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "A :" "men." "A : : : : : : : :" \skip 1 \skip 1 \skip 1 "men."
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne b2 d'2 d'2( c'2 d'1) b1 }
        \new Voice { \voiceTwo e2 d2_\fermata g,2( a,2 b,4 c4 d2) g1_\fermata }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
