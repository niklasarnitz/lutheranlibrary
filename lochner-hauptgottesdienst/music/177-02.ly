\version "2.24.3"
% Scan 177, printed p. 152: Amen zu den Collecten, Nr. 2.
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
      \new Voice = "sung" { \voiceOne a'\breve g'\breve \bar "|." }
      \new Voice { \voiceTwo fis'\breve d'\breve }
    >>
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t A "men."
    }
    \new Staff <<
      \clef bass  \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne d'\breve b\breve }
      \new Voice { \voiceTwo d\breve g,\breve }
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
