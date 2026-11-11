\version "2.24.3"
% Scan 177, printed p. 152: Amen zu den Collecten, Nr. 8.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble  \cadenzaOn \omit Staff.TimeSignature
      \new Voice = "sung" { \voiceOne g'2( a'2 g'1 fis'1) g'\breve \bar "|." }
      \new Voice { \voiceTwo d'2( f'2 e'1 d'1) d'\breve }
    >>
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t "A : : : : : : :" \repeat unfold 3 { \skip 1 } "men."
    }
    \new Staff <<
      \clef bass  \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne b2( d'2 b1 a1) b\breve }
      \new Voice { \voiceTwo g,2( d2 e1 d1) g,\breve }
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
