\version "2.24.3"
% Scan 177, printed p. 152: Amen zu den Collecten, Nr. 10.
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
      \clef treble \key g \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice = "sung" { \voiceOne fis'1.( g'2) g'\breve \bar "|." }
      \new Voice { \voiceTwo d'\breve d'\breve }
    >>
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t "A : : :" \skip 1 "men."
    }
    \new Staff <<
      \clef bass \key g \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne a1.( b2) b\breve }
      \new Voice { \voiceTwo d1.( g,2) g,\breve }
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
